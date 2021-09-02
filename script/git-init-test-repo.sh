git init
echo 1 > numbers.txt
git add numbers.txt
git commit -m "One"
echo 2 >> numbers.txt
git commit -a -m "Two"
git checkout -b letters
echo a > letters.txt
git add letters.txt
git commit -m "A"
echo b >> letters.txt
git commit -a -m "B"
git checkout master
echo 3 >> numbers.txt
git commit -a -m "Three"
