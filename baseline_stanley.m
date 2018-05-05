
some_image = imread('240.jpg');
[h, w, c]=size(some_image);
generated_img = zeros(h, w, c);

images = cell(9);
count = 1;

start_file_index = 240;
end_file_index = 300;

for i = start_file_index:end_file_index
    file_name = strcat(int2str(i),'.jpg');
    curr_image = imread(file_name);
    images{count} = curr_image;
    count = count + 1;
    generated_img = generated_img + double(curr_image);
end

generated_img = generated_img / count;
generated_img = uint8(generated_img);
% imshow(generated_img); % vanilla average

% generated_img = imrotate(generated_img,35); % rotation
generated_img = wiener2(generated_img, [2, 2]); % try to remove noise
imshow(generated_img);

