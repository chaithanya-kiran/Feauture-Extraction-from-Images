im1 = imread('saras9t.jpg');

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