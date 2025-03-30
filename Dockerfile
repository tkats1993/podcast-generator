FROM ubuntu:latest

# Ενημέρωση και εγκατάσταση πακέτων
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    git 

# Δημιουργία Virtual Environment
RUN python3 -m venv /venv

# Ενεργοποίηση Virtual Environment και εγκατάσταση πακέτων
RUN /venv/bin/pip install --no-cache-dir PyYAML

# Ορισμός του Virtual Environment ως προεπιλεγμένο
ENV PATH="/venv/bin:$PATH"

# Ορισμός working directory
WORKDIR /app

# Αντιγραφή αρχείων
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Ορισμός εκτελέσιμων δικαιωμάτων
RUN chmod +x /entrypoint.sh

# Ορισμός entrypoint
ENTRYPOINT ["/entrypoint.sh"]
