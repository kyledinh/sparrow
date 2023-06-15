from pydantic import BaseSettings
import os
import sys

class Settings(BaseSettings):
    huggingface_access_token: str = os.environ['HUGGINGFACE_ACCESS_TOKEN'] 
    sparrow_key: str = "123456"
    dataset_name: str = "katanaml-org/invoices-donut-data-v1"
    ocr_stats_file: str = "data/ocr_stats.json"

# Ensure all required environment variables are set
try:  
  os.environ['HUGGINGFACE_ACCESS_TOKEN']
except KeyError: 
  print('[error]: `HUGGINGFACE_ACCESS_TOKEN` environment variable required')
  sys.exit(1)

settings = Settings()

# Setting optional SPARROW_KEY from env, or use default 
try:  
  settings.sparrow_key = os.environ['SPARROW_KEY']
except KeyError: 
  print('[error]: `SPARROW_TOKEN` environment variable not set! Using default `123456')
