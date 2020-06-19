function ImageOut = ImageLaplacian(ImageIn)

ImageIn = im2double(ImageIn);
[M,N] = size(ImageIn);
firstFactor = zeros(M,N);
secondFactor = zeros(M,N);
ImageOut = zeros(M,N);
BetterImage = zeros(M,N);

zeroPad = zeros(size(ImageIn) + 2*fix(3/2));
[X,Y] = size(zeroPad);

for a = 1:M
	for b = 1:N
		zeroPad(a+fix(3/2), b+fix(3/2)) = ImageIn(a,b);
	end
end

for a = 2:X-1
	for b = 2:Y-1
		firstFactor(a-1, b-1) = zeroPad(a-1,b) - 2*zeroPad(a,b) + zeroPad(a+1,b);
	end
end

for a = 2:X-1
	for b = 2:Y-1
		secondFactor(a-1, b-1) = zeroPad(a,b-1) - 2*zeroPad(a,b) + zeroPad(a,b+1);
	end
end

ImageOut = firstFactor + secondFactor;
BetterImage = ImageIn - ImageOut;

figure, imshow(ImageIn);
title({"Lena"})
figure, imshow(ImageOut);
title({"Lena after applying Laplacian Operator"})
figure, imshow(BetterImage);	
title({"Lena after subing the image from Laplace operator from original Image"})
