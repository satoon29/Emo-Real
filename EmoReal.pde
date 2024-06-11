
import http.requests.*;
String url = "https://script.google.com/macros/s/AKfycbz0AJC0ND9DwU_I9QQyz0LJq2yPMY9cRAzZu5-lcXW1U_QxKamrfqpgfB9tFHFS5nVa0g/exec";


Emoji e[];
RepresentativeEmoji rep_e[];
ChildEmoji child_e[];
DrawText t;
DrawEmoji Draw_Emoji;
RepresentativeEmoji selected_Emoji;
Emoji send_Emoji;
Emoji sended_Emoji;

void setup() {
  size(400, 400);
  textSize(25);
  background(255);


  e = new Emoji[24];
  rep_e = new RepresentativeEmoji[6];
  child_e = new ChildEmoji[4];
  t = new DrawText();

  for (int i=0; i<6; i++) {
    rep_e[i] = new RepresentativeEmoji(i);
  }

  Draw_Emoji = new DrawEmoji(rep_e);
}

void draw() {
  background(255);
  t.kidoairaku();
  if (send_Emoji != null) {
    sendDataToGoogleSheets(str(send_Emoji.id));
    println("sended " + str(send_Emoji.id));
    sended_Emoji = send_Emoji;
    send_Emoji = null;
  }

  if (sended_Emoji == null) {
    t.drawInputEmoji();
  } else {
    t.drawSelectedEmoji(sended_Emoji, selected_Emoji != null);

  }
  Draw_Emoji.draw();
  if(selected_Emoji != null){
    selected_Emoji.drawChild();
    if(sended_Emoji != null){
      
    }
  }
  if (mousePressed) {
      //クリックした箇所にグレーの円を描画
      fill(100,100);
      noStroke();
      ellipse(mouseX, mouseY, 30, 30);
      noFill();
      stroke(1);
    }
}

//マウスがクリックされたときの処理
void  mousePressed() {
  //6つの代表絵文字について領域内判定
  if (selected_Emoji == null) {
    for (int i = 0; i<rep_e.length; i++) {
      if (rep_e[i].isPressed(mouseX, mouseY)) {
        //println(i);
        //選択された絵文字以外を削除
        Draw_Emoji.delete(i);

        //現在選択されている絵文字を設定
        rep_e[i].isSelected = true;
        selected_Emoji = rep_e[i];
        break;
      }
    }
  }
}


void mouseReleased() {
  for (int i=0; i<rep_e.length; i++) {
    rep_e[i].isSelected = false;
  }

  Draw_Emoji.display();
  for (int i=0; i<3; i++) {
    if (selected_Emoji != null)
      if (selected_Emoji.isPressed(mouseX, mouseY)) {
        send_Emoji = selected_Emoji;
        t.drawLoading();
      } else if (selected_Emoji.child[i].isPressed(mouseX, mouseY)) {
        send_Emoji = selected_Emoji.child[i];
        t.drawLoading();
      }
  }
  selected_Emoji = null;
}

void sendDataToGoogleSheets(String data) {
  PostRequest post = new PostRequest(url);
  post.addData("data", data);
  post.send();
}
