import { sOptions } from "../ts/interfaces/options";

export const swaggerOptions: sOptions = {
    definition:{
     openapi:"1.0.0",
     info:{
        title: "Portfolio API",
        version: "1.0.0",
        description:"This is an api where frontend devs could use to creates UI Apps for protfolios"
     },
     servers: [
         {
             url:"http://localhost:8041"
         }
     ]
    },
    apis: ["./routes/*.ts"] 
 }