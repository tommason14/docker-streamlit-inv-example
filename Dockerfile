from python:3.10-slim

COPY . /app
WORKDIR /app

RUN apt update && apt install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install -r requirements.txt 

RUN apt install -y git 

# invoke task stored in separate repo - emulating the repos that we would download 
RUN git clone https://www.github.com/tommason14/test-inv 

EXPOSE 8501

CMD ["streamlit", "run", "streamlit_example.py"]
