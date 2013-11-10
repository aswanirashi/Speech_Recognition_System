clc; clear all;

input_dir ='train_ind/';
output_dir = 'train/';
dir_in = dir(input_dir);
noOfFiles = length(dir_in);

for i = 3: 8: (noOfFiles - 7)
i
    ma = [];
    for j = 0: 7
        file = sprintf('%s%s',input_dir,dir_in(i+j).name)
	 s = dlmread(file);
         s = s(2:end,1:end);
         ma = [ma; s];
    end
    outfile = sprintf('%s%s',output_dir,dir_in(i).name(1:5))
    dlmwrite(outfile,ma, 'delimiter', ' ');
end
