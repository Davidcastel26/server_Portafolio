import express, { Express } from 'express';
import { Server } from 'socket.io';
import cors from 'cors';
import helmet from 'helmet';
import dotenv from 'dotenv';
import { corsConfig } from '../configs/corsConfig';
import swaggerJsdoc from 'swagger-jsdoc';
import swaggerUi from 'swagger-ui-express'
import { swaggerOptions } from '../configs/swaggerOptions';
import { Paths } from '../ts/enums/mainPath';
import { userRoute } from '../routes';
import { sessionMiddleware, wrap } from './redis';

dotenv.config();

const port = process.env.PORT || 8041;
const app: Express = express();
export const server = require("http").createServer(app);
const io = new Server( server, { cors: corsConfig} );

app.use( helmet() );
app.use( cors(corsConfig) );
app.use( express.json );

app.use( Paths.users, userRoute)

const spacs = swaggerJsdoc( swaggerOptions );

app.use('/api-docs', 
    swaggerUi.serve,
    swaggerUi.setup(spacs) 
)
io.use(wrap(sessionMiddleware))

app.listen(port, () => {
    console.log(`----- RUNING ON PORT ${port} -----`);
})