import { NextFunction, Response, Request } from "express";
import prismaDb from "../../models/prismaDb";


export const getAllUsers = async (
    req: Request,
    res: Response,
    next: NextFunction
) => {

    try {

        const allUsers = await prismaDb.user.findMany({
            // include:{
                // tags: true,
                // about: true,
                // projects: true
            // }
        })
        
        return res.status(200).json(allUsers)

    } catch (error) {
        next(error)
    }
    
}