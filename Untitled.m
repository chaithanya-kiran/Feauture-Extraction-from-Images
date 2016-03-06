%function[] = DCTIF_demo()
close all;
clear all;
home;
flg = 1; % 1: display the results & 0: no display

imt = double(imread('saras9t.jpg'));

im1 = double(imread('saras91.jpg'));
im2 = double(imread('saras92.jpg'));

if flg == 1
    figure(1); imshow(im1,[]);
    figure(2); imshow(im2,[]);
    pause(1);
end

h = waitbar(0,'Please wait...');
bs = [2 4 8 16 32 64 128 256 512]; %block size
lbs = length(bs);
for i=1:lbs
 
[m,n] = size(im1);
for i=1:bs:m
    for j=1:bs:n
        cb1 = im1(i:i+bs-1,j:j+bs-1);
        cb2 = im2(i:i+bs-1,j:j+bs-1);
        CB1 = dct2(cb1);
        CB2 = dct2(cb2);
        dl = abs(CB1)-abs(CB2)>=0;
        CBF = dl.*CB1+(~dl).*CB2;
        CBF(1,1)=0.5*(CB1(1,1)+CB2(1,1));
        cbf = idct2(CBF);
        imfav(i:i+bs-1,j:j+bs-1)=cbf;
    end
end

end

im1 = imfav;

[m,n] = size(im1)

bs = [2 4 8 16 32 64 128 256 512]; %block size
lbs = length(bs)
for i=1:lbs
    for i=1:bs:m-1
        for j=2:bs:n-1
            temp=dct2(im1(i,j))-dct2(im1(i,j-1));
            temp1=temp.^2;      
        end
    end
    rf1=temp1/(m*n);
    rf=sqrt(rf1);

    for j=1:bs:n-1
        for i=2:bs:m-1
            tmp=dct2(im1(i,j))-dct2(im1(i-1,j));
            tmp=tmp.^2;
        end
    end
    cf1=tmp/(m*n);
    cf=sqrt(cf1);

    sf=sqrt(rf1+cf1)
end