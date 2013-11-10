function train_spk(train_dir,store_means_dir,k)

	files=dir(train_dir);
    files
	nf=size(files,1);
    nf
	train=cell(nf-2,1);

	for i=3:nf
		train{i-2}=dlmread([train_dir files(i).name]);
	end

	c=cell(nf-2,1);
	ic=c;
	newc=c;
	for j=1:nf-2
	    x=train{j};
	    [idx c{j}] = kmeans(x,k);
        means=c{j};
	    dlmwrite([store_means_dir files(j+2).name],means,' ');
	end


end
