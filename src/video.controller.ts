import { Controller, Get, Param, Res } from '@nestjs/common';
import { Response } from 'express';
import { join } from 'path';
import { createReadStream } from 'fs';

@Controller('videos')
export class VideoController {
  @Get(':filename')
  getVideo(@Param('filename') filename: string, @Res() res: Response) {
    // Définissez le chemin vers le dossier contenant les vidéos
    const filePath = join(__dirname, '..', 'uploads', 'videos', filename);
    console.log(filePath);
    
    // Créez un flux pour lire le fichier vidéo
    const fileStream = createReadStream(filePath);
    fileStream.on('open', () => {
      // Déclenche la lecture en continu (stream) du fichier vidéo
      res.setHeader('Content-Type', 'video/mp4');
      fileStream.pipe(res);
    });

    fileStream.on('error', (err) => {
      res.status(404).send('Vidéo non trouvée');
    });
  }
}
