import { Router } from 'express';
import { check } from 'express-validator';
import { validateAreas } from '../middlewares/validate';

// controllers
import { 
    getAllUsers, 
    getUserById 
    } from '../controllers/mainControllers/users.controllers';
import { existUserId } from '../helpers/validations/user.validations';

const router = Router();

router.get('/', getAllUsers);

router.get('/:idUser',[
    check('idUser').custom( existUserId ),
    validateAreas
], getUserById)

export default router;