## Important: in order to keep the matrix correct, it's important to specify -o auto
join --header -j 1 -a 1 -a 2 -t '	' -o auto -e NA <(awk 'NR==1; NR>1{print $0 | "sort -n"}' file1) <(awk 'NR==1; NR>1{print $0 | "sort -n"}' file2)

join --header -a 1 -a 2 -j 1 -t ' ' -o auto -e NA <(awk 'NR==1; NR>1{print $0|"sort -n"}' file1) <(awk 'NR==1; NR>1{print $0|"sort -n"}' file2)

join -a 1 -a 2 -j 1 --header -t '	' -o auto -e NA <(awk 'NR==1; NR>1{print $0 | "sort -n"}' file1) <(awk 'NR==1; NR>1{print $0 | "sort -n"}' file2) | join -a 1 -a 2 -j 1 --header -t '	' -o auto -e NA - <(awk 'NR==1; NR>1{print $0 | "sort -n"}' file3)

## try my script
./multijoin.bash -H file1 file2 file3
