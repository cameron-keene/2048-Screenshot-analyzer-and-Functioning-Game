function [new_board,score] = MakeMove(board,direction)
%     clc; clear;
% board = input('Enter board in []: ');
% direction = input('Enter the direction: ','s');
score = 0;
if strcmp(direction,'left')
    %nothing happens, just run through sort enginer
end
%mirror right #1
if strcmp(direction,'right')
    for ii = 1:1:4
        board(ii,1:4) = board(ii,4:-1:1);
    end
end
%transpose up 1
if strcmp(direction,'up')
    board = board';
end
%transpose down #1 then mirror down #1
if strcmp(direction,'down')
    board = board';
    for ii = 1:1:4
        board(ii,1:4) = board(ii,4:-1:1);
    end
end
%sorting engine
for ii = 1:1:4
    
    %       [0 0 0 4] ----> [4 0 0 0]
    if (board(ii,1) == 0) && (board(ii,2) == 0) && (board(ii,3) == 0) && (board(ii,4) ~= 0)
        board(ii,1) = board(ii,4);
        board(ii,4) = 0;
        %       [0 0 2 2] ---> [4 0 0 0] or [0 0 2 4] ---> [2 4 0 0]
    elseif (board(ii,1) == 0) && (board(ii,2) == 0) && (board(ii,3) ~= 0) && (board(ii,4) ~= 0)
        %[0 0 2 4] ---> [2 4 0 0]
        if board(ii,3) ~= board(ii,4)
            board(ii,1) =board(ii,3);
            board(ii,2) = board(ii,4);
            board(ii,3) = 0;
            board(ii,4) = 0;
            %[0 0 2 2] ---> [4 0 0 0]
        elseif board(ii,3) == board(ii,4)
            x = board(ii,3) + board(ii,4);
            board(ii,1) = x;
            board(ii,2:4) = 0;
            score = score + x;
        end
        % [0 0 2 0] ---> [2 0 0 0]
    elseif (board(ii,1) == 0) && (board(ii,2) == 0) && (board(ii,3) ~= 0) && (board(ii,4) == 0)
        board(ii,1) = board(ii,3);
        board(ii,3) = 0;
        % [2 0 2 0] ---> [4 0 0 0] or [2 0 4 0] ---> [2 4 0 0]
    elseif (board(ii,1) ~= 0) && (board(ii,2) == 0) && (board(ii,3) ~= 0) && (board(ii,4) == 0)
        % [2 0 2 0] ---> [4 0 0 0]
        if board(ii,1) == board(ii,3)
            x = board(ii,1)*2;
            board(ii,1) = x;
            board(ii,3) = 0;
            score = score + x;
            % [2 0 4 0] ---> [2 4 0 0]
        elseif board(ii,1) ~= board(ii,3)
            board(ii,2) = board(ii,3);
            board(ii,3) = 0;
        end
        %       % [2 0 0 2] ---> [4 0 0 0] or [2 0 0 4] ---> [2 4 0 0]
    elseif (board(ii,1) ~= 0) && (board(ii,2) == 0) && (board(ii,3) == 0) && (board(ii,4) ~= 0 )
        %           % [2 0 0 2] ---> [4 0 0 0]
        if board(ii,1) == board(ii,4)
            x = board(ii,1)*2;
            board(ii,1) = x;
            board(ii,4) = 0;
            score = score + x;
            % [2 0 0 4] ---> [2 4 0 0]
        elseif board(ii,1) ~= board(ii,4)
            board(ii,2) = board(ii,4);
            board(ii,4) = 0;
        end
        %[32 0 32 32] ---> [64 32 0 0] or [32 0 64 64] ---> [32 128 0 0]
    elseif (board(ii,1) ~= 0) && (board(ii,2) == 0) && (board(ii,3) ~= 0) && (board(ii,4) ~= 0)
        % [32 0 32 32] ---> [64 32 0 0]
        if board(ii,1) == board(ii,3)
            x = board(ii,1)*2;
            board(ii,1) = x;
            board(ii,3) = 0;
            board(ii,2) = board(ii,4);
            board(ii,4) = 0;
            score = score + x;
            % [32 0 64 64] ---> [32 128 0 0]
        elseif board(ii,3) == board(ii,4)
            x = board(ii,3)*2;
            board(ii,2) = x;
            board(ii,3:4) = 0;
        elseif (board(ii,1) ~= board(ii,3)) && (board(ii,3) ~= board(ii,4))
            board(ii,2) = board(ii,3);
            board(ii,3) = board(ii,4);
            board(ii,4) = 0;
        end
        % [2 4 0 16] ---> [2 4 16 0] or [2 2 0 16] ---> [4 16 0 0] or
        % [2 4 0 4] ----> [2 8 0 0]
    elseif (board(ii,1) ~= 0) && (board(ii,2) ~= 0) && (board(ii,3) == 0) && (board(ii,4) ~= 0)
        %[2 2 0 16] ---> [4 16 0 0]
        if board(ii,1) == board(ii,2)
            x = board(ii,1)*2;
            board(ii,1) = x;
            board(ii,2) = 0;
            board(ii,2) = board(ii,4);
            board(ii,4) = 0;
            score = score + x;
            %[2 4 0 4] ----> [2 8 0 0]
        elseif board(ii,2) == board(ii,4)
            x = board(ii,2)*2;
            board(ii,2) = x;
            board(ii,3:4) = 0;
            % [2 4 0 16] ---> [2 4 16 0]
        else
            board(ii,3) = board(ii,4);
            board(ii,4) = 0;
        end
        %[1024 1024 1024 0] ---> [2048 1024 0 0 ] or
        %[1024 64 64 0] ---> [1024 128 0 0]
    elseif (board(ii,1) ~= 0) && (board(ii,2) ~= 0) && (board(ii,3) ~= 0) && (board(ii,4) == 0)
        %[1024 1024 1024 0] ---> [2048 1024 0 0 ]
        if board(ii,1) == board(ii,2)
            x = board(ii,1)*2;
            board(ii,1) = x;
            board(ii,2) = board(ii,3);
            board(ii,3) = 0;
            score = score + x;
            %[1024 64 64 0] ---> [1024 128 0 0]
        elseif board(ii,2) == board(ii,3)
            x = board(ii,2)*2;
            board(ii,2) = x;
            board(ii,3:4) = 0;
            score = score + x;
        end
        % [2 2 0 0] ---> [4 0 0 0]
    elseif (board(ii,1) ~= 0) && (board(ii,2) ~= 0) && (board(ii,3) == 0) && (board(ii,4) == 0)
        if board(ii,1) == board(ii,2)
            x = board(ii,1)*2;
            board(ii,1) = x;
            board(ii,2) = 0;
            score = score + x;
        end
        % [0 2 0 0] ---> [2 0 0 0]
    elseif (board(ii,1) == 0) && (board(ii,2) ~= 0) && (board(ii,3) == 0) && (board(ii,4) == 0)
        board(ii,1) = board(ii,2);
        board(ii,2) = 0;
        % [0 2 0 2] ---> [4 0 0 0] or [0 2 0 4] ---> [2 4 0 0]
    elseif (board(ii,1) == 0) && (board(ii,2) ~= 0) && (board(ii,3) == 0) && (board(ii,4) ~= 0)
        % [0 2 0 2] ---> [4 0 0 0]
        if board(ii,2) == board(ii,4)
            x  = board(ii,2)*2;
            board(ii,1) = x;
            board(ii,2) = 0;
            board(ii,4) = 0;
            score = score + x;
            % [0 2 0 4] ---> [2 4 0 0]
        elseif board(ii,1) ~= board(ii,4)
            board(ii,2) = board(ii,4);
            board(ii,4) = 0;
        end
    elseif (board(ii,1) == 0) && (board(ii,2) ~= 0) && (board(ii,3) ~= 0)  && (board(ii,4) ~= 0)
        if (board(ii,2) ~= board(ii,3)) && (board(ii,3) ~= board(ii,4))
            board(ii,1) =board(ii,2);
            board(ii,2) = board(ii,3);
            board(ii,3) = board(ii,4);
            board(ii,4) = 0;
            % [0 1024 1024 1024] ---> [2048 1024 0 0]
        elseif (board(ii,2) == board(ii,3)) && (board(ii,3) == board(ii,4))
            x = board(ii,2)*2;
            board(ii,1) = x;
            board(ii,2) = board(ii,3);
            board(ii,3:4) = 0;
            score = score + x;
        elseif (board(ii,3) == board(ii,4)) && (board(ii,2) ~= board(ii,3))
            x = board(ii,3) + board(ii,4);
            board(ii,1) = board(ii,2);
            board(ii,2) = x;
            board(ii,3:4) = 0;
            score = score + x;
        elseif board(ii,2) == board(ii,3)
            x = board(ii,2)*2;
            board(ii,1) = x;
            board(ii,2) = board(ii,4);
            board(ii,3:4) = 0;
            score = score + x;
        end
        %[0 2 2 0] ---> [4 0 0 0]
    elseif (board(ii,1) == 0) && (board(ii,2) ~= 0) && (board(ii,3) ~= 0)  && (board(ii,4) == 0)
        if board(ii,2) == board(ii,3)
            x = board(ii,2)*2;
            board(ii,1) = x;
            score = score + x;
            board(ii,2:4) = 0;
        elseif board(ii,2) ~= board(ii,3)
            board(ii,1) = board(ii,2);
            board(ii,2) = board(ii,3);
            board(ii,3:4) = 0;
        end
    elseif (board(ii,1:4) ~= 0)
        if (board(ii,1) == board(ii,2)) && (board(ii,3) ~= board(ii,4))
            x = board(ii,1) + board(ii,2);
            board(ii,1) = x;
            board(ii,2) = board(ii,3);
            board(ii,3) = board(ii,4);
            board(ii,4) = 0;
            score = score + x;
        elseif board(ii,2) == board(ii,3) && (board(ii,3) ~= board(ii,4))
            x = board(ii,2) + board(ii,3);
            board(ii,2) = x;
            board(ii,3) = board(ii,4);
            board(ii,4) = 0;
            score = score + x;
            % [16 1024 1024 1024] ---> [16 2048 1024 0]
        elseif board(ii,2) == board(ii,3) && board(ii,3) == board(ii,4) && (board(ii,1) ~= board(ii,2))
            x = board(ii,2)*2;
            board(ii,2) = x;
            board(ii,3) = board(ii,4);
            board(ii,4) = 0;
            score = score + x;
        elseif (board(ii,1) == board(ii,2)) && (board(ii,3) == board(ii,4))
            x = board(ii,1)*2;
            y = board(ii,3)*2;
            board(ii,1) = x;
            board(ii,2) = y;
            board(ii,3:4) = 0;
            score = score + x + y;
        end
        
    end
end
%mirror right #2
if strcmp(direction,'right')
    for ii = 1:1:4
        board(ii,1:4) = board(ii,4:-1:1);
    end
end
%transpose up 2
if strcmp(direction,'up')
    board = board';
end
%mirror down #2 then transpose down #2
if strcmp(direction,'down')
    for ii = 1:1:4
        board(ii,1:4) = board(ii,4:-1:1);
    end
    board = board';
end
new_board = board;
end