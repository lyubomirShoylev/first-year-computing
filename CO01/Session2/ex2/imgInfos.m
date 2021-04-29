clear all
close all

imgName = input('Search for an image: ', 's');
% use try-catch to handle file possibly not in this dir
try
    disp(imfinfo(imgName));
catch ex
    disp(ex.message);
end

dirName = input('Give a directory(full or relative path): ', 's');
% use try-catch to handle path not existing
try
    oldDir = cd(dirName);   % store old working folder so we could 
                            % easily return back to it after
    
    imgsInDir = dir('*.jpg'); 
    if ~isempty(imgsInDir)
        arrayfun(@(x) disp(imfinfo(x.name)), imgsInDir)
        % arrayfun applies the provided func (first argument) on every
        % member of the provided array (second argument); note that we
        % provide a lambda func with the desired ation; all this is to
        % avoid using loops and explicit func definitions
    else
        disp('No images found!');
    end
    
    cd(oldDir);             % return to previous working dir
catch ex
    disp(ex.message);
end

