// TTS Designer Live Server
// Run: node serve_designer.js
// Then open http://localhost:3000/TTS_Designer.html

const http = require('http');
const fs = require('fs');
const path = require('path');

const PORT = 3000;
const STATE_FILE = path.join(__dirname, '_designer_live_state.json');

const MIME = {
    '.html': 'text/html',
    '.js': 'text/javascript',
    '.css': 'text/css',
    '.json': 'application/json',
    '.png': 'image/png',
    '.jpg': 'image/jpeg',
    '.jpeg': 'image/jpeg',
    '.gif': 'image/gif',
    '.svg': 'image/svg+xml',
    '.ico': 'image/x-icon',
};

const server = http.createServer((req, res) => {
    // CORS
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, PUT, OPTIONS');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

    if (req.method === 'OPTIONS') {
        res.writeHead(204);
        res.end();
        return;
    }

    // API: GET live state
    if (req.method === 'GET' && req.url === '/api/state') {
        fs.readFile(STATE_FILE, 'utf8', (err, data) => {
            if (err) {
                res.writeHead(200, { 'Content-Type': 'application/json' });
                res.end(JSON.stringify({ elements: [], nextId: 1, canvasW: '1920', canvasH: '1080' }));
                return;
            }
            res.writeHead(200, { 'Content-Type': 'application/json' });
            res.end(data);
        });
        return;
    }

    // API: PUT live state
    if (req.method === 'PUT' && req.url === '/api/state') {
        let body = '';
        req.on('data', chunk => body += chunk);
        req.on('end', () => {
            try {
                const data = JSON.parse(body);
                fs.writeFile(STATE_FILE, JSON.stringify(data, null, 2), 'utf8', (err) => {
                    if (err) {
                        res.writeHead(500, { 'Content-Type': 'application/json' });
                        res.end(JSON.stringify({ error: 'Write failed' }));
                        return;
                    }
                    console.log('State saved (' + (data.elements || []).length + ' elements)');
                    res.writeHead(200, { 'Content-Type': 'application/json' });
                    res.end(JSON.stringify({ ok: true }));
                });
            } catch(e) {
                res.writeHead(400, { 'Content-Type': 'application/json' });
                res.end(JSON.stringify({ error: 'Invalid JSON' }));
            }
        });
        return;
    }

    // Serve static files
    let filePath = path.join(__dirname, req.url === '/' ? '/TTS_Designer.html' : req.url);
    
    fs.readFile(filePath, (err, data) => {
        if (err) {
            res.writeHead(404, { 'Content-Type': 'text/plain' });
            res.end('Not found');
            return;
        }
        const ext = path.extname(filePath).toLowerCase();
        res.writeHead(200, { 'Content-Type': MIME[ext] || 'application/octet-stream' });
        res.end(data);
    });
});

server.listen(PORT, () => {
    console.log('TTS Designer Live Server running at:');
    console.log('  http://localhost:' + PORT + '/TTS_Designer.html');
    console.log('  State file: ' + STATE_FILE);
    console.log('  Press Ctrl+C to stop');
});
