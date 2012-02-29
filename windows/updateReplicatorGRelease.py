import argparse
import re
import shutil

"""
Backup origFile to backupFile filename, then search for
version numbers containing oldRelease, and update them to specify newRelease
"""
def scanAndUpdateInstaller(origFile="ReplicatorG.nsi", backupFile="bk.nsi",
	oldRelease='0032', newRelease='0033'):
        anyUpdated = False	
	redict = {}
	for name in ['ReplicatorG ', 'ReplicatorG-','replicatorg-']:
		redict[name+oldRelease] = name+newRelease

	fh = open(origFile)
	data = fh.readlines()
	fh.close()
	shutil.move(origFile,backupFile)	
	
	newData = []	
	
	for line in data:
		newline = line
		for key in redict:
			if(re.search(key, line) != None):
				newline = re.sub(key, redict[key], line, count=100)		
				anyUpdated = True
				print 'updated: ' + newline
		newData.append(newline)
	if(anyUpdated == False):
		print('*** WARNING: no updates to installer! ***')

	fh = open(origFile,"w+")
	fh.writelines(newData)
	fh.close()

if __name__ == "__main__":
	print 'force updating installer names'
	parser = argparse.ArgumentParser(description="update installer")
	#parser.add_argument('orig', help='origional filename', default="ReplicatorG.nsi")
	#parser.add_argument('bak', help='backup filename', default='backup.nsi')
	parser.add_argument('last', help='last version number', default='0030')
	parser.add_argument('new', help='new version number', default ='0031')

	args = parser.parse_args()
	#print(args)		
	scanAndUpdateInstaller(oldRelease=args.last, newRelease=args.new);

