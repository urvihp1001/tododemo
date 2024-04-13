package com.example.tododemo.Task;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name="TaskItem")
public class TaskItem {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
private long id;
@NotNull(message = "title is required")
private String title;
private boolean done;
public TaskItem(){  
}
public TaskItem(String title)
{
    this.title=title;
    this.done=false;
}
public Long getId(){
    return id;
}
public void setId(Long id){
    this.id=id;
}
public String getTitle(){
    return title;
}
public void setTitle(String title){
    this.title=title;
}
public boolean isDone(){
    return done;
}
public void setDone(boolean done) {
    this.done = done;
}

}
