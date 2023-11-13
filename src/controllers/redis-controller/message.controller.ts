import { Request, Response, NextFunction, request } from 'express';
import { redisClient } from 'models/redis';
import { nanoid } from 'nanoid';

export const createMessage =async (
    req: Request,
    res: Response,
    next: NextFunction
) => {

    const { text, tags } = req.body;

    try {
        
        const commentId = nanoid();
        //  add comment to list 
        await redisClient.rPush('comments', commentId)

    } catch (error) {
        console.log(
            res.status(400).json(next(error))
        );
    }
}