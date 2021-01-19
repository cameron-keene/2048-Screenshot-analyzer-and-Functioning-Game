clc; clear;
%pulls the filename from the user
filename = input('Enter filename: ','s');
%reading the filename to a variable
pix = imread(filename);
%setting variables equal to the h,w,c of the image
[h,w,c] = size(pix);
%creating binary image for testing
binary = false(h,w);
%creates 4x4 matrix of all zeros
board = zeros(4,4);
%nested for loops search entire picture and finds where the pixel is equal
%to the color of the boarder
%once the boarder is found it sets binary equal to 1 for the postion in the
%original picture
for ii = 1:1:h
    for jj = 1:1:w
        if (pix(ii,jj,1) == 187) && (pix(ii,jj,2) == 173) && (pix(ii,jj,3) == 160)
            binary(ii,jj) = 1;
            
        end
    end
    
end
%finds where the binary image is equal to 1
[rows, columns] = find(binary == 1);
%finds the min and max of the rows
row1 = min(rows);
row2 = max(rows);
%finds the min and max of the columns
col1 = min(columns);
col2 = max(columns);
%crops the orignal picture based of the min and max values of binary
pixnew = pix(row1:row2, col1:col2, :);
%getting new variables based on new dimensions of cropped picture
[xx,yy,cc] = size(pixnew);
%creating two new variables
pos11 = 1;
pos22 = 1;
%nested for loop, that only takes one pixel in every square, 
%to search the cropped picture for where it is equal to the color
%corresponding to each value of possible squares
for ii = 50:121:xx
    for jj = 50:121:yy
        %searches cropped pix for where it is equal to the color of the 2
        %block
        if (pixnew(ii,jj,1) == 238) && (pixnew(ii,jj,2) == 228) && (pixnew(ii,jj,3) == 218)
            pos11 = round(ii/100);
            pos22 = round(jj/100);
            board(pos11,pos22) = 2;
        %searches cropped pix for where it is equal to the color of the 4
        %block
        elseif (pixnew(ii,jj,1) == 237) && (pixnew(ii,jj,2) == 224) && (pixnew(ii,jj,3) == 200)
            pos11 = round(ii/100);
            pos22 = round(jj/100);
            board(pos11,pos22) = 4;
        %searches cropped pix for where it is equal to the color of the 8
        %block
        elseif (pixnew(ii,jj,1) == 242) && (pixnew(ii,jj,2) == 177) && (pixnew(ii,jj,3) == 121)
            pos11 = round(ii/100);
            pos22 = round(jj/100);
            board(pos11,pos22) = 8;
        %searches cropped pix for where it is equal to the color of the 16
        %block
        elseif (pixnew(ii,jj,1) == 245) && (pixnew(ii,jj,2) == 149) && (pixnew(ii,jj,3) == 99)
            pos11 = round(ii/100);
            pos22 = round(jj/100);
            board(pos11,pos22) = 16;
        %searches cropped pix for where it is equal to the color of the 32
        %block
        elseif (pixnew(ii,jj,1) == 246) && (pixnew(ii,jj,2) == 124) && (pixnew(ii,jj,3) == 95)
            pos11 = round(ii/100);
            pos22 = round(jj/100);
            board(pos11,pos22) = 32;
        %searches cropped pix for where it is equal to the color of the 64
        %block
        elseif (pixnew(ii,jj,1) == 246) && (pixnew(ii,jj,2) == 94) && (pixnew(ii,jj,3) == 59)
            pos11 = round(ii/100);
            pos22 = round(jj/100);
            board(pos11,pos22) = 64;
        %searches cropped pix for where it is equal to the color of the 128
        %block
        elseif (pixnew(ii,jj,1) == 237) && (pixnew(ii,jj,2) == 207) && (pixnew(ii,jj,3) == 114)
            pos11 = round(ii/100);
            pos22 = round(jj/100);
            board(pos11,pos22) = 128;
        %searches cropped pix for where it is equal to the color of the 256
        %block
        elseif (pixnew(ii,jj,1) == 237) && (pixnew(ii,jj,2) == 204) && (pixnew(ii,jj,3) == 97)
            pos11 = round(ii/100);
            pos22 = round(jj/100);
            board(pos11,pos22) = 256;
        %searches cropped pix for where it is equal to the color of the 512
        %block
        elseif (pixnew(ii,jj,1) == 237) && (pixnew(ii,jj,2) == 200) && (pixnew(ii,jj,3) == 80)
            pos11 = round(ii/100);
            pos22 = round(jj/100);
            board(pos11,pos22) = 512;
        %searches cropped pix for where it is equal to the color of the
        %1024 block
        elseif (pixnew(ii,jj,1) == 237) && (pixnew(ii,jj,2) == 197) && (pixnew(ii,jj,3) == 63)
            pos11 = round(ii/100);
            pos22 = round(jj/100);
            board(pos11,pos22) = 1024;
        %searches cropped pix for where it is equal to the color of the
        %2048 block
        elseif (pixnew(ii,jj,1) == 237) && (pixnew(ii,jj,2) == 194) && (pixnew(ii,jj,3) == 46)
            pos11 = round(ii/100);
            pos22 = round(jj/100);
            board(pos11,pos22) = 2048;
        end
    end
end
%outputs the newly constructed matrix
disp(board)