# Use CIAO tools
search_csc pos="04:27:04.69, +26:06:16.06" radius=0.02 outfile=DGTau.tsv filetypes=pha,arf,rmf download=all root=./ 

# DG Tau has been observed several times, so from the downloaded products
# I picked one to place in this directory.
mv ./2CXOJ042704.6+260615/04487_001/* .
# And then clean up the remaining downloaded files
rm -rf 2CXOJ042704.6+260615
rm DGTau.tsv
