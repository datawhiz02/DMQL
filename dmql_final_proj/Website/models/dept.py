from sqlalchemy import  Column, String, SMALLINT, CHAR, Integer
from website import base
from flask import Flask

class Dept(base):
    __tablename__ = 'dept'

    dept_no = Column(SMALLINT, primary_key=True)
    dept_name = Column(String)
    no_of_doctors = Column(Integer)
