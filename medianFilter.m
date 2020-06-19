function ImageOut = MedianFilter(ImageIn, N)

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

	
%disp(ImageOut);
for i = CounterC:X-(CounterC-1)
	for j = CounterC:Y-(CounterC-1)
		Neighboors = [];
		for x = i-(CounterC-1):i+(CounterC-1)
			for y = j-(CounterC-1):j+(CounterC-1)
				Neighboors = [Neighboors zeroPad(x,y)];
			end
		end
		Neighboors = sort(Neighboors);
		ImageOut(i-(CounterC-1), j-(CounterC-1)) = Neighboors(fix((N*N)/2)+1);
		%ImageOut = uint8(ImageOut);
		%Sum = 0;
	end
end

%ImageOut = uint8(ImageOut);
if N == 5
	figure, imshow(ImageIn);
	title({"BarabaraSaltAndPep with noise"})
	figure, imshow(ImageOut);
	title({"BarbaraSaltAndPep after apply the Median lilter 5x5 using Algorithm"})
	figure, imshow(medfilt2(ImageIn, [N N]));
	title({"BarbaraSaltAndPep after apply the Median lilter 5x5 using medfilt2"})
elseif N == 7
	figure, imshow(ImageIn);
	title({"BarabaraSaltAndPep with noise"})
	figure, imshow(ImageOut);
	title({"BarbaraSaltAndPep after apply the Median filter 7x7 using Algorithm"})
	figure, imshow(medfilt2(ImageIn, [N N]));
	title({"BarbaraSaltAndPep after apply the Median filter 7x7 using medfilt2"})
elseif N == 11
	figure, imshow(ImageIn);
	title({"BarabaraSaltAndPep with noise"})
	figure, imshow(ImageOut);
	title({"BarbaraSaltAndPep after apply the Median filter 11x11 using Algorithm"})
	figure, imshow(medfilt2(ImageIn, [N N]));
	title({"BarbaraSaltAndPep after apply the Median filter 11x11 using medfilt2"})
end
end
