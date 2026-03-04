// 玩家系统
// 自动生成于 2026-03-04T02:16:57.728Z

class Player {
  constructor(scene, x, y) {
    this.scene = scene;
    this.sprite = scene.physics.add.sprite(x, y, 'player');
    this.speed = 200;
    this.isMoving = false;
  }

  create() {
    this.cursors = this.scene.input.keyboard.createCursorKeys();
    this.wasd = this.scene.input.keyboard.addKeys({
      up: Phaser.Input.Keyboard.KeyCodes.W,
      down: Phaser.Input.Keyboard.KeyCodes.S,
      left: Phaser.Input.Keyboard.KeyCodes.A,
      right: Phaser.Input.Keyboard.KeyCodes.KeyD
    });
  }

  update() {
    this.handleInput();
    this.applyMovement();
  }

  handleInput() {
    this.isMoving = false;
    this.velocityX = 0;
    this.velocityY = 0;

    if (this.cursors.left.isDown || this.wasd.left.isDown) {
      this.velocityX = -this.speed;
      this.isMoving = true;
    } else if (this.cursors.right.isDown || this.wasd.right.isDown) {
      this.velocityX = this.speed;
      this.isMoving = true;
    }

    if (this.cursors.up.isDown || this.wasd.up.isDown) {
      this.velocityY = -this.speed;
      this.isMoving = true;
    } else if (this.cursors.down.isDown || this.wasd.down.isDown) {
      this.velocityY = this.speed;
      this.isMoving = true;
    }
  }

  applyMovement() {
    this.sprite.setVelocity(this.velocityX, this.velocityY);
  }
}

module.exports = Player;
