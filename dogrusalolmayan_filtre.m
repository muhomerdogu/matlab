clc
clear all
img=double(imread('od.jpg','jpg'))
[m,n]=size(img);
p=3;
for i=1:m-p
    for j=1:n-p
        w=img((i:i+p-1),(j:j+p-1));
        img(i,j)=median(w(:));
    end
end
img2=uint16(img2)
imshow(img2)
imwrite(img2,'omera.png','png')
