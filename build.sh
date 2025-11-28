#!/usr/bin/env bash

# Exit on error
set -o errexit

echo "=== Build Script Starting ==="

# Install Python dependencies
echo "Installing dependencies..."
pip install -r requirements.txt

# Set encoding for Unicode support
export PYTHONIOENCODING=utf-8

# Initialize database with schema only (data will be imported on first request if needed)
echo "Creating database schema..."
python -c "
import sqlite3
import os
if os.path.exists('premier_league.db'):
    os.remove('premier_league.db')
with open('schema.sql', 'r') as f:
    conn = sqlite3.connect('premier_league.db')
    conn.executescript(f.read())
    conn.commit()
    conn.close()
    print('✓ Database schema created!')
"

echo "=== Build Complete ==="
echo "Note: Historical data will be imported automatically on first app startup"
