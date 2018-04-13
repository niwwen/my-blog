if [ -d $1 ]; then
  echo 'error: dir exists'
 exit 1
else
  mkdir $1
  cd $1
  mkdir css js
  touch index.html css/style.css js/main.js
  exit 0
fi

