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
num8c = 0;
num16c = 0;
num32c = 0;
num64c = 0;
num128c = 0;
num256c = 0;
num512c = 0;
board = zeros(4,4);

%loop to search the image for the different color of blocks
for ii = 1:1:h
    for jj = 1:1:w
        % identifies the number 2 block
        if (pix(ii,jj,1) < 239) && (pix(ii,jj,1) > 237) && (pix(ii,jj,2) < 229) && (pix(ii,jj,2) > 227)
            binary(ii,jj) = 1;
            %             if num2c == 10801
            %                 board(ceil(jj/100),floor(ii/100)) = 2;
            %                 num2c = 0;
            %                 count2 = count2 +1;
            %             end
            pos2 = [ii jj];
            num2c = num2c + 1;
            % identifies the number 4 block
        elseif (pix(ii,jj,1) < 238) && (pix(ii,jj,1) > 236) && (pix(ii,jj,2) < 225) && (pix(ii,jj,2) > 223)
            binary(ii,jj) = 1;
            num4c = num4c + 1;
            % identifies the number 8 block
        elseif (pix(ii,jj,1) < 243) && (pix(ii,jj,1) > 241) && (pix(ii,jj,2) < 178) && (pix(ii,jj,2) > 176)
            binary(ii,jj) = 1;
            num8c = num8c + 1;
            % identifies the number 16 block
        elseif (pix(ii,jj,1) < 246) && (pix(ii,jj,1) > 244) && (pix(ii,jj,2) < 150) && (pix(ii,jj,2) > 148)
            binary(ii,jj) = 1;
            num16c = num16c + 1;
            % identifies the number 32 block
        elseif (pix(ii,jj,1) < 247) && (pix(ii,jj,1) > 245) && (pix(ii,jj,2) < 125) && (pix(ii,jj,2) > 123)
            binary(ii,jj) = 1;
            num32c = num32c + 1;
            % identifies the number 64 block
        elseif (pix(ii,jj,1) < 247) && (pix(ii,jj,1) > 245) && (pix(ii,jj,2) < 95) && (pix(ii,jj,2) > 93)
            binary(ii,jj) = 1;
            num64c = num64c + 1;
            % identifies the number 128 block
        elseif (pix(ii,jj,1) < 238) && (pix(ii,jj,1) > 236) && (pix(ii,jj,2) < 208) && (pix(ii,jj,2) > 206)
            binary(ii,jj) = 1;
            num128c = num128c + 1;
            % identifies the number 256 block
        elseif (pix(ii,jj,1) < 238) && (pix(ii,jj,1) > 236) && (pix(ii,jj,2) < 205) && (pix(ii,jj,2) > 203)
            binary(ii,jj) = 1;
            num256c = num256c + 1;
            % identifies the number 256 block
        elseif (pix(ii,jj,1) < 238) && (pix(ii,jj,1) > 236) && (pix(ii,jj,2) < 201) && (pix(ii,jj,2) > 199)
            binary(ii,jj) = 1;
            num512c = num512c + 1;
        end
        
    end
end

%dividing overall counter by the area of one block
num2c = round(num2c / 11236);
num4c = round(num4c / 11236);
num8c = round(num8c / 11236);
num16c = round(num16c / 11236);
num32c = round(num32c / 11236);
num64c = round(num64c / 11236);
num128c = round(num128c / 11236);
num256c = round(num256c / 11236);
num512c = round(num512c / 11236);

%printing out the number of squares for testing
fprintf('The count of num 2: %d\n',num2c);
fprintf('The count of num 4: %d\n',num4c);
fprintf('The count of num 8: %d\n',num8c);
fprintf('The count of num 16: %d\n',num16c);
fprintf('The count of num 32: %d\n',num32c);
fprintf('The count of num 64: %d\n',num64c);
fprintf('The count of num 128: %d\n',num128c);
fprintf('The count of num 256: %d\n',num256c);
fprintf('The count of num 512: %d\n',num512c);

%comparing pix to binary for comparison testing
imshowpair(pix,binary,'montage');

disp(board)