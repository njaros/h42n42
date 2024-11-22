class creet _id _x _y _vx _vy = object
  (self)
  val mutable x: int = _x
  val mutable y: int = _y
  val mutable vx: int = _vx
  val mutable vy: int = _vy
  val mutable px = 3
  val mutable py = 4
  val mutable size = 1
  val mutable count = 0
  val max_x = 300
  val max_y = 200
  val id: int = _id

  method move_x =
    let move = x + vx in
    if move > max_x then (
        x <- 2 * max_x - vx - x;
        vx <- -vx;
        count <- count + 1
    ) else if move < 0 then (
        x <- -x - vx;
        vx <- -vx;
        count <- count + 1
    ) else (
        x <- x + vx
    )

  method move_y =
    let move = y + vy in
    if move > max_y then (
        y <- 2 * max_y - vy - y;
        vy <- -vy;
        count <- count + 1
    ) else if move < 0 then (
        y <- -y - vy;
        vy <- -vy;
        count <- count + 1
    ) else (
        y <- y + vy
    )

  method move =
    self#move_x;
    self#move_y

  method getPos =
    [x; y]

  method printPos =
    Printf.printf "id: %i -> X: %i; Y: %i\n" id x y;
    flush stdout

  method getId =
    id

  method run =
    if count = 30 then
      Lwt.return_unit
    else
      let%lwt () = Lwt_unix.sleep 0.01 in
      self#move;
      self#printPos;
      self#run
  
  end
