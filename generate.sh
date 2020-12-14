#! /bin/bash

pandoc md/index.md -s -V mainfont="TeX"  -o docs/index.html -c style.css --toc --template pandoc-bootstrap/template.html --include-in-header pandoc-bootstrap/header.html --include-before-body pandoc-bootstrap/navbar.html --include-after-body pandoc-bootstrap/footer.html --katex
pandoc md/image_processing.md -s -V mainfont="TeX"  -o docs/image_processing.html -c style.css --toc --template pandoc-bootstrap/template.html --include-in-header pandoc-bootstrap/header.html --include-before-body pandoc-bootstrap/navbar.html --include-after-body pandoc-bootstrap/footer.html --katex
