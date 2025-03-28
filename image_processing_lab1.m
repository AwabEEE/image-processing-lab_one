% Read the image
img = imread('lena.jpg');

% Convert to grayscale if necessary (assumes color image by default)
if ndims(img) == 3
  img = rgb2gray(img);
end

% Perform the 2D DFT using fft2
dft = fft2(img);

% Shift the zero-frequency component to the center for visualization
dft_shifted = fftshift(dft);

% Compute the magnitude spectrum
magnitude_spectrum = abs(dft_shifted);

% Apply a logarithmic scaling for better visualization
log_magnitude = log(1 + magnitude_spectrum);

% Perform inverse shift before applying inverse DFT
dft_ishifted = ifftshift(dft_shifted);

% Compute the inverse DFT
reconstructed_img = ifft2(dft_ishifted);

% Take the real part of the image (to remove imaginary components)
reconstructed_img = real(reconstructed_img);

% Display all results in one figure
figure;
colormap gray;

% Show original image
subplot(1,3,1);
imshow(img, []);
title('Original Image');

% Show magnitude spectrum
subplot(1,3,2);
imshow(log_magnitude, []);
title('Magnitude Spectrum (Log)');

% Show reconstructed image
subplot(1,3,3);
imshow(reconstructed_img, []);
title('Reconstructed Image (Inverse DFT)');
