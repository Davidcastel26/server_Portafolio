import { NextFunction, Response, Request } from "express";
import prismaDb from "../../models/prismaDb";

export const getUserById =  async (
    req: Request,
    res: Response,
    next: NextFunction
) => {

    const { idUser } = req.params;

    try {

        const getUser = await prismaDb.user.findUnique({
            where:{ idUser },
            include: {
                tags: true,
                about: true,
                projects: true
            }
        })
        
        res.status(200).json(getUser)

    } catch (error) {
      return console.log(
          res.status(401).json( next(error) )
      )
    }

}

export const getAllUsers = async (
    req: Request,
    res: Response,
    next: NextFunction
) => {

    try {

        const allUsers = await prismaDb.user.findMany()
            // {
            // include:{
                // tags: true,
                // about: true,
                // projects: true
            // }
        // })
        return res.status(200).json(allUsers)

    } catch (error) {
        return console.log(
            res.status(401).json( next(error) )
        )
    }
    
}