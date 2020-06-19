function ImageOut = AverageFilter(ImageIn, N)


[M,Z] = size(ImageIn);
ImageOut = zeros(M,Z);
zeroPad = zeros(size(ImageIn) + 2*fix(N/2));
[X,Y] = size(zeroPad);
for a = 1:M
	for b = 1:Z
		zeroPad(a+fix(N/2), b+fix(N/2)) = ImageIn(a,b);
	end
end
if N == 5
	CounterC = 3;
elseif N == 7
	CounterC = 4;
elseif N == 11
	CounterC = 6;
end

	

for i = CounterC:X-(CounterC-1)
	for j = CounterC:Y-(CounterC-1)
		Sum = 0;
		for x = i-(CounterC-1):i+(CounterC-1)
			for y = j-(CounterC-1):j+(CounterC-1)
				Sum = Sum + zeroPad(x,y);
			end
		end
		ImageOut(i-(CounterC-1), j-(CounterC-1)) = Sum/(N*N);
		
	end
end

%ImageOut = uint8(ImageOut);
op = filter2(fspecial('average',N),ImageIn)/255;

if N == 5 && Z == 256
	figure, imshow(ImageIn);
	title({"BarabaraGaussianNoise "})
	figure, imshow(ImageOut);
	title({"BarbaraGaussianNoise after apply the average filter 5x5 using Algorithm"})
	figure, imshow(medfilt2(ImageIn, [N N]));
	title({"BarbaraGaussianNoise after apply the average filter 5x5 using filter2"})
elseif N == 5 && Z == 512
	figure, imshow(ImageIn);
	title({"boat512"})
	figure, imshow(ImageOut);
	title({"boat512 after apply the average filter 5x5 using Algorithm"})
elseif N == 7
	figure, imshow(ImageIn);
	title({"BarabaraGaussianNoise "})
	figure, imshow(ImageOut);
	title({"BarbaraGaussianNoise after apply the average filter 7x7 using Algorithm"})
	figure, imshow(medfilt2(ImageIn, [N N]));
	title({"BarbaraGaussianNoise after apply the average filter 7x7 using filter2"})
elseif N == 11
	figure, imshow(ImageIn);
	title({"BarabaraGaussianNoise "})
	figure, imshow(ImageOut);
	title({"BarbaraGaussianNoise after apply the average filter 11x11 using Algorithm"})
	figure, imshow(medfilt2(ImageIn, [N N]));
	title({"BarbaraGaussianNoise after apply the average filter 11x11 using filter2"})
end
end
