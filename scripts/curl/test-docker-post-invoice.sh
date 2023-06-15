#!/bin/bash

curl -X 'POST' \
  'https://katanaml-org-sparrow-data.hf.space/api-ocr/v1/sparrow-data/ocr' \
  -H 'accept: application/json' \
  -H 'Content-Type: multipart/form-data' \
  -F 'file=' \
  -F 'image_url=https://raw.githubusercontent.com/katanaml/sparrow/main/sparrow-data/docs/input/invoices/processed/images/invoice_10.jpg' \
  -F 'sparrow_key=123456'