import express, { Express } from 'express';
import { Server } from 'socket.io';
import cors from 'cors';
import helmet from 'helmet';
import dotenv from 'dotenv';
import { corsConfig } from '../configs/corsConfig';

dotenv.config();

const port = process.env.PORT || 8041;
const app: Express = express();
export const server = require("http").createServer(app);
const io = new Server( server, {cors : corsConfig} );

app.use('/', () => {})

io.use(()=>{})

app.listen(port, () => {
    console.log(`----- RUNING ON PORT ${port} -----`);
})