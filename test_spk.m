function test_spk(means_dir,test_dir,k)

	files=dir(means_dir);
	nf=size(files,1);
	means=cell(nf-2,1);
	for i=3:nf
		means{i-2}=dlmread([means_dir files(i).name]);
	end
	
	files=dir(test_dir);
	nf=size(files,1);
	test=cell(nf-2,1);
	for i=3:nf
		tmp=dlmread([test_dir files(i).name]);
		test{i-2}=tmp(2:end,:);
	end

	err=zeros(nf-2,1);
 	error=err;
 	corr=0;
 	confmatrix=zeros(nf-2,nf-2);
                                
 	for l=1:nf-2
 	    y=test{l};
 	    [nrt nct]=size(y);
 	    dist=zeros(k,nrt);
 	    for j=1:nf-2
 	        for i=1:k
 	            h=repmat(means{j}(i,:),nrt,1);
		    dist(i,:)=(sum(((y'-h').^2)));
 	        end
 	        [minval index]=min(dist);
 	       err(j)=sum(minval);
 	    end
 	   
     	    [error(l) sp_id]=min(err);
	    sp_id
        l
     	    if(sp_id==l)
     		corr=corr+1;
     	    end
	end
	accuracy=corr/(nf-2)

 end
