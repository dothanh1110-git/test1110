FROM python:3.12-alpine

WORKDIR /app

# Sao chép các file cần thiết
COPY main.py .
COPY cache.py .
COPY locale .
COPY db_migrate .
COPY requirements.txt .

# Xóa file .po
RUN find locale -name "*.po" -type f -delete

# Cài đặt các thư viện
RUN pip install -r requirements.txt
RUN rm requirements.txt

# Thiết lập biến môi trường (thay thế bằng token và group ID của bạn)
ENV TOKEN="6511660861:AAHs_zXek_uXQhHpP-lowP4Jx8gwpAzihQ4"
ENV GROUP_ID="-1002170951655"
ENV LANGUAGE="en_US"

# Chạy bot
CMD ["python", "-u", "main.py", "-token", "$TOKEN", "-group_id", "$GROUP_ID", "-language", "$LANGUAGE"]