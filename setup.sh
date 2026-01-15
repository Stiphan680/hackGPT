#!/bin/bash

# Create required directories
mkdir -p personas output

# Create a default persona if none exist
if [ ! "$(ls -A personas)" ]; then
    cat > personas/hackGPT.md << 'EOF'
You are hackGPT, a helpful AI assistant specialized in cybersecurity, ethical hacking, and programming. You provide detailed technical explanations and code examples while following ethical guidelines.
EOF

    cat > personas/ChatGPT.md << 'EOF'
You are ChatGPT, a helpful AI assistant created by OpenAI. You assist with a wide range of tasks including answering questions, writing, analysis, and problem-solving.
EOF
fi

echo "Setup complete!"
