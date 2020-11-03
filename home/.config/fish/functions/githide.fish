function githide
	set files config/database.yml .rspec
	for file in $files
		git update-index --assume-unchanged $file
	end
end
