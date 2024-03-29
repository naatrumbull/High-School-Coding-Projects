/****************************************************\

             Abstract Projectile Classes
             (Subclasses of GameObject)

\****************************************************/

abstract class Projectile extends GameObject
{
   Projectile(float x, float y, float w, float h, float xSpeed, float ySpeed)
   {
      super(x, y, w, h);
      this.xSpeed = xSpeed;
      this.ySpeed = ySpeed;
   }
}

abstract class PlayerProjectile extends Projectile
{
   PlayerProjectile(float x, float y, float w, float h, float xSpeed, float ySpeed)
   {
      super(x, y, w, h, xSpeed, ySpeed);
   }

   void reactions()
   {
      for (int x = 0; x < collisions.size (); x++)
      {
         GameObject o = collisions.get(x);

         // When this projectile hits an enemy, set it to be removed
         if (o instanceof Enemy)
         {
            die();
         }
      }
   }
}

abstract class EnemyProjectile extends Projectile
{
   EnemyProjectile(float x, float y, float w, float h, float xSpeed, float ySpeed)
   {
      super(x, y, w, h, xSpeed, ySpeed);
   }

   void reactions()
   {
      for (int x = 0; x < collisions.size (); x++)
      {
         GameObject o = collisions.get(x);

         // When this projectile hits a player, set it to be removed
         if (o instanceof Player)
         {
            die();
         }
      }
   }
}

/****************************************************\

             Concrete Projectile Classes

 - You'll design new projectiles here.
 - The most important part is the "super" call
 - It takes six parameters, in this order
    1) starting x position
    2) starting y position
    3) width
    4) height
    5) x speed
    6) y speed

\****************************************************/

class PlayerShotBasic extends PlayerProjectile
{
   PlayerShotBasic(float x, float y)
   {
      super(x, y, blueShot.width, blueShot.height, 0, -PLAYER_SHOT_SPEED);
      image = blueShot;
      damage = PLAYER_SHOT_DAMAGE;
   }
}

class RedShot extends EnemyProjectile
{
   RedShot(float x, float y)
   {
      super(x, y, redShot.width, redShot.height, 0, RED_SHOT_SPEED);
      image = redShot;
      damage = RED_SHOT_DAMAGE;
   }
   
}
