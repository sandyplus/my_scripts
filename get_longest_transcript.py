#!/usr/bin/env python
longest_geneid = ''
length_of_longest_geneid = 0
transcript_id = ''
lastline = ''
fpa = open("out.gtf","w")
with open("merged.gtf") as f:
	for line in f:
                # split string into substrings
                subline = line.split("\t")
                # first get the length of each transcript, the name of this gene
                each_length = abs(int(subline[4]) - int(subline[3]))
                each_geneid = subline[8][9:20]
                each_transcript_id = subline[8][38:]
                # judge if it is the same gene
                if each_geneid != longest_geneid:
                	print "length is %d" %length_of_longest_geneid
                	print longest_geneid
                	print transcript_id 
			print >> fpa, lastline
			lastline = line
                	longest_geneid = each_geneid
                	length_of_longest_geneid = each_length
                	transcript_id = each_transcript_id
                else:
                	if each_length > length_of_longest_geneid:
                        # second, get the longest transcript for each gene_id
                        	length_of_longest_geneid = each_length
                        	longest_geneid = each_geneid 
                        	transcript_id = each_transcript_id
				lastline = line
                        #print "in else if, length is %d" %length_of_longest_geneid
print >> fpa, lastline #print the last line of file
fpa.close()
