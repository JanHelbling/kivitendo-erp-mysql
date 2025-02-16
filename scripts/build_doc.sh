#!/bin/bash

# Usage:
#   cd /path/to/kivitendo
#   ./scripts/build_doc.sh

set -e

if [[ ! -d doc ]]; then
  echo "Please run this from the installation directory."
  exit 1
fi

doc=${PWD}/doc

if [[ ! -d doc/build/dobudish ]]; then
  echo "  ERROR: looks like 'doc/build/dobudish' DIR is missing"
  echo "   - You need to get 'dobudish-nojre-1.1.4.zip' from http://code.google.com/p/dobudish/downloads/list"
  echo "   - Download and unpack ( unzip dobudish-nojre-1.1.4.zip -d doc/build )"
  echo "   - create dobudish symlink ( ln -sf dobudish-1.1.4 doc/build/dobudish )"
fi

html=1
pdf=1
images=1

if [[ ! -z $1 ]] ; then
  html=0
  pdf=0
  images=0
  while [[ ! -z $1 ]] ; do
    case $1 in
      html)   html=1   ;;
      pdf)    pdf=1    ;;
      images) images=1 ;;
      *)
        echo "Unknown parameter $1"
        exit 1
        ;;
    esac

    shift
  done
fi

cd doc/build/dobudish

base=documents/dokumentation
if [[ ! -d $base ]]; then
  ./generator.sh dokumentation create book
fi

input=${base}/input
output=${base}/output
custom=${base}/custom-cfg

rm -rf ${input} ${custom}
mkdir ${input} ${input}/copy_to_output ${custom}

cp ${doc}/dokumentation.xml ${input}/
test -d ${doc}/images && cp -R ${doc}/images ${input}/copy_to_output/
cp -R ${doc}/build/custom-cfg/* ${custom}/

if [[ $pdf = 1 ]] ; then
  ./generator.sh dokumentation pdf
  cp ${output}/pdf/dokumentation.pdf ${doc}/kivitendo-Dokumentation.pdf
fi

if [[ $html = 1 ]]; then
  ./generator.sh dokumentation html
  rm -rf ${doc}/html
  mkdir ${doc}/html
  cp -R ${output}/html ${doc}/
fi

if [[ $images = 1 ]]; then
  # copy system images from Dobudish directory
  image_list=$(mktemp)
  perl -nle 'print $1 while m{ (?: \.\./ )+ ( system/ [^\"]+ ) }xg' ${doc}/html/*.html | sort | uniq > $image_list
  if [[ -s $image_list ]]; then
    tar -c -f - -T $image_list | tar -x -f - -C ${doc}/html
    perl -pi -e 's{ (\.\./)+ system }{system}xg' ${doc}/html/*.html
  fi

  rm $image_list
fi
