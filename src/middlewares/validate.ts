import { NextFunction, request, Response } from "express";
import { validationResult } from "express-validator";

export const validateAreas = ( req: typeof request, res: Response, next: NextFunction) => {
    const errors = validationResult(req);

    if(!errors.isEmpty()) return res.status(400).json(errors);

    next();
}