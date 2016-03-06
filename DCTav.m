%function[] = DCTIF_demo()
close all;
clear all;
home;
flg = 1; % 1: display the results & 0: no display

imt = double(imread('saras9t.jpg'));
imshow(imt,[]);
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
        CBF = 0.5*(CB1+CB2);
        CBF(1,1)=0.5*(CB1(1,1)+CB2(1,1));
        cbf = idct2(CBF);
        imfav(i:i+bs-1,j:j+bs-1)=cbf;
    end
end

    
    %Display results
    if flg == 1
        figure(i+2);
        subplot(121); imshow(imfav,[]);     
        imd = imt-imfav;
        subplot(122); imshow(imd,[]);        
        pause(0.2);
    end
end
close(h);
