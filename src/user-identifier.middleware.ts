import { Injectable, NestMiddleware } from '@nestjs/common';
import { Request, Response, NextFunction } from 'express';
import { v4 as uuidv4 } from 'uuid';
import { UserService } from './user.service';

@Injectable()
export class UserIdentifierMiddleware implements NestMiddleware {
  constructor(private readonly userService: UserService) {}

  async use(req: Request, res: Response, next: NextFunction) {
    let browserId = req.cookies['userId'];

    if (!browserId) {
      // Générer un nouvel identifiant pour un nouvel utilisateur
      browserId = uuidv4();
      res.cookie('userId', browserId, { httpOnly: true, maxAge: 1000 * 60 * 60 * 24 * 365 }); // 1 an
      console.log('Nouvel utilisateur, browserId généré:', browserId);
    } else {
      console.log('Utilisateur existant, browserId:', browserId);
    }

    // Rechercher ou créer l'utilisateur dans la base de données
    let user = await this.userService.findByBrowserId(browserId);
    if (!user) {
      user = await this.userService.create({ browser_id: browserId });
      console.log('Nouvel utilisateur créé avec ID:', user.id);
    } else {
      console.log('Utilisateur existant trouvé avec ID:', user.id);
    }

    // Attacher l'ID de l'utilisateur à la requête
    req['userId'] = user.id;
    console.log('userId attaché à req:', req['userId']);

    next();
  }
}
