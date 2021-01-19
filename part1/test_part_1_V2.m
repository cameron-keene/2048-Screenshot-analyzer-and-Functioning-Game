clc; clear;
%pulls the filename from the user
filename = input('Enter filename: ','s');
%reading the filename to a variable
pix = imread(filename);
%setting variables equal to the h,w,c of the image
[h,w,c] = size(pix);
%creating binary image for testing
binary = false(h,w);
%creating counter variables
count2 = 0;
num2c = 0;
pos2 = [];
num4c = 0;
bpos = [];
cc = 1;
a = 0;
board = zeros(4,4);


for ii = 1:1:h
    for jj = 1:1:w
        if (pix(ii,jj,1) == 187) && (pix(ii,jj,2) == 173) && (pix(ii,jj,3) == 160)
            binary(ii,jj) = 1;
            
        end
    end
    
end


%loop to search the image for the different color of blocks
for ii = 1:1:h
    for jj = 1:1:w
        if (pix(ii,jj,1) < 239) && (pix(ii,jj,1) > 237) && (pix(ii,jj,2) < 229) && (pix(ii,jj,2) > 227) && (pix(ii,jj,3) < 219) && (pix(ii,jj,3) > 217)
            binary(ii,jj) = 1;
            pos2 = [ii jj];
            num2c = num2c + 1;
            % identifies the number 4 block
        elseif (pix(ii,jj,1) < 238) && (pix(ii,jj,1) > 236) && (pix(ii,jj,2) < 225) && (pix(ii,jj,2) > 223) && (pix(ii,jj,3) < 201) && (pix(ii,jj,3) > 199)
            binary(ii,jj) = 1;
            num4c = num4c + 1;
        end
        
    end
end
% for ii = bb:123:(bb+494)
%     for jj = aa:123:(aa+494)
%         if (pix(ii,jj,1) == 238) && (pix(ii,jj,2) == 228)
%             board(ii,jj) = 2;
%         end
%     end
% end
[rows, columns] = find(binary == 1);
row1 = min(rows);
row2 = max(rows);
col1 = min(columns);
col2 = max(columns);
% pixnew = uint8(zeros(row2, col2, 3));
pixnew = pix(row1:row2, col1:col2, :);
[xx,yy,cc] = size(pixnew);
pos11 = 1;
pos22 = 1;

for ii = 50:121:xx
    for jj = 50:121:yy
        %2
        if (pixnew(ii,jj,1) == 238) && (pixnew(ii,jj,2) == 228) && (pixnew(ii,jj,3) == 218)
            pos11 = round(ii/100);
            pos22 = round(jj/100);
            board(pos11,pos22) = 2;
            %4
        elseif (pixnew(ii,jj,1) == 237) && (pixnew(ii,jj,2) == 224) && (pixnew(ii,jj,3) == 200)
            pos11 = round(ii/100);
            pos22 = round(jj/100);
            board(pos11,pos22) = 4;
            %8
        elseif (pixnew(ii,jj,1) == 242) && (pixnew(ii,jj,2) == 177) && (pixnew(ii,jj,3) == 121)
            pos11 = round(ii/100);
            pos22 = round(jj/100);
            board(pos11,pos22) = 8;
            %16
        elseif (pixnew(ii,jj,1) == 245) && (pixnew(ii,jj,2) == 149) && (pixnew(ii,jj,3) == 99)
            pos11 = round(ii/100);
            pos22 = round(jj/100);
            board(pos11,pos22) = 16;
            %32
        elseif (pixnew(ii,jj,1) == 246) && (pixnew(ii,jj,2) == 124) && (pixnew(ii,jj,3) == 95)
            pos11 = round(ii/100);
            pos22 = round(jj/100);
            board(pos11,pos22) = 32;
            %64
        elseif (pixnew(ii,jj,1) == 246) && (pixnew(ii,jj,2) == 94) && (pixnew(ii,jj,3) == 59)
            pos11 = round(ii/100);
            pos22 = round(jj/100);
            board(pos11,pos22) = 64;
            %128
        elseif (pixnew(ii,jj,1) == 237) && (pixnew(ii,jj,2) == 207) && (pixnew(ii,jj,3) == 114)
            pos11 = round(ii/100);
            pos22 = round(jj/100);
            board(pos11,pos22) = 128;
            %256
        elseif (pixnew(ii,jj,1) == 237) && (pixnew(ii,jj,2) == 204) && (pixnew(ii,jj,3) == 97)
            pos11 = round(ii/100);
            pos22 = round(jj/100);
            board(pos11,pos22) = 256;
            %512
        elseif (pixnew(ii,jj,1) == 237) && (pixnew(ii,jj,2) == 200) && (pixnew(ii,jj,3) == 80)
            pos11 = round(ii/100);
            pos22 = round(jj/100);
            board(pos11,pos22) = 512;
            %1024
        elseif (pixnew(ii,jj,1) == 237) && (pixnew(ii,jj,2) == 197) && (pixnew(ii,jj,3) == 63)
            pos11 = round(ii/100);
            pos22 = round(jj/100);
            board(pos11,pos22) = 1024;
            %2048
        elseif (pixnew(ii,jj,1) == 237) && (pixnew(ii,jj,2) == 194) && (pixnew(ii,jj,3) == 46)
            pos11 = round(ii/100);
            pos22 = round(jj/100);
            board(pos11,pos22) = 2048;
        end
    end
end

%dividing overall counter by the area of one block
num2c = floor(num2c / 11236);
num4c = floor(num4c / 11236);


%printing out the number of squares for testing
fprintf('The count of num 2: %d\n',num2c);
fprintf('The count of num 4: %d\n',num4c);


%comparing pix to binary for comparison testing
% imshowpair(pix,pixnew,'montage');
imshow(pixnew);

disp(board)