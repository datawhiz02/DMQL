from flask import Flask, render_template, request, flash, url_for, redirect, abort
# import psycopg2
from flask_bootstrap import Bootstrap

from sqlalchemy import create_engine
from sqlalchemy.engine import URL
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base  

from sqlalchemy import  Column, String, SMALLINT, CHAR, Integer, Numeric, Date

from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, IntegerField, DateField, DecimalField
from wtforms.validators import DataRequired




app = Flask(__name__)
app.config['SECRET_KEY'] = '1323'
bootstrap = Bootstrap(app)

# form

class DeptForm(FlaskForm):
    dept_no = IntegerField('dept_no', validators=[DataRequired()])
    dept_name = StringField('dept_name', validators=[DataRequired()])
    submit = SubmitField('Submit')

class EmployeeForm(FlaskForm):
    e_id = DecimalField('e_id', validators=[DataRequired()])
    e_type = StringField('e_type', validators=[DataRequired()])
    first_name = StringField('first_name', validators=[DataRequired()])
    last_name = StringField('last_name', validators=[DataRequired()])
    dob = DateField('dob', validators=[DataRequired()])
    address = StringField('address', validators=[DataRequired()])
    gender = StringField('gender', validators=[DataRequired()])
    phone_number = StringField('phone_number', validators=[DataRequired()])
    emergency_contact = StringField('emergency_contact', validators=[DataRequired()])
    date_of_joining = DateField('date_of_joining', validators=[DataRequired()])
    date_of_resigning = DateField('date_of_resigning')
    submit = SubmitField('Submit')

class PatientForm(FlaskForm):
    p_id = DecimalField('p_id', validators=[DataRequired()])
    first_name = StringField('first_name', validators=[DataRequired()])
    last_name = StringField('last_name', validators=[DataRequired()])
    gender = StringField('gender', validators=[DataRequired()])
    phone_number = StringField('phone_number', validators=[DataRequired()])
    dob = DateField('dob', validators=[DataRequired()])
    emergency_contact = StringField('emergency_contact', validators=[DataRequired()])
    address = StringField('address', validators=[DataRequired()])
    email = StringField('email', validators=[DataRequired()])
    submit = SubmitField('Submit')
    


## db connection

url = URL.create(
    drivername="postgresql",
    username="postgres",
    host="localhost",
    database="V2",
    password="1234"
    
)

engine = create_engine(url, connect_args={'options': '-csearch_path={}'.format('hospital')})
print("Successfully connected to the database.")
connection = engine.connect()



Session = sessionmaker(bind=engine)
base = declarative_base()
session = Session()

class Dept(base):
    __tablename__ = 'dept'

    dept_no = Column(SMALLINT, primary_key=True)
    dept_name = Column(String)
    no_of_doctors = Column(Integer)

class Employee(base):
    __tablename__ = "employee"

    e_id = Column(Numeric, primary_key=True)
    e_type = Column(String)
    first_name = Column(String)
    last_name = Column(String)
    dob = Column(Date)
    address = Column(String)
    gender = Column(String)
    phone_number = Column(String)
    emergency_contact = Column(String)
    date_of_joining = Column(Date)
    date_of_resigning = Column(Date)

class Patient(base):
    __tablename__ = "patient"

    p_id = Column(Numeric, primary_key=True)
    first_name = Column(String)
    last_name = Column(String)
    gender = Column(String)
    phone_number = Column(String)
    dob = Column(Date)
    emergency_contact = Column(String)
    address = Column(String)
    email = Column(String)
    



# app.config['SQLALCHEMY_DATABASE_URI'] = "postgresql://postgres:postgres@localhost:5432/hospital_latest"
# db = SQLAlchemy(app)
# migrate = Migrate(app, db)


# main screen
@app.route("/hospital", methods = ['GET'])
def home_screen():
    return render_template("index.html")

# departments screen

@app.route("/hospital/dept", methods = ['GET'])
def getDept():
    depts = session.query(Dept)
    return render_template("departments.html", departments=depts)

@app.route("/hospital/dept/add", methods=['GET', 'POST'])
def add_dept():

    add_dept = True

    form = DeptForm()
    if form.validate_on_submit():
        dept = Dept(dept_no = form.dept_no.data, dept_name = form.dept_name.data)
        try:
            # setattr(dept, 'dept_no', form.dept_no.data)
            # setattr(dept, 'dept_name', form.dept_name.data)
            session.add(dept)
            session.commit()
            flash('You have successfully added a new department.')
        except:
            flash('Error: dept no already exists.')
        return redirect(url_for('getDept'))
    return render_template('department.html', action="Add",
                           add_department=add_dept, form=form,
                           title="Add Department")


@app.route('/hospital/dept/edit/<int:id>', methods=['GET','POST'])
def edit_dept(id):

    add_department = False

    dept = session.query(Dept).filter(Dept.dept_no == id).one()  
    form = DeptForm(obj=dept)
    if form.validate_on_submit():
        setattr(dept, 'dept_name', form.dept_name.data)
        session.commit()
        flash('You have successfully edited the department.')

        return redirect(url_for('getDept'))
    
    form.dept_name.data = dept.dept_name
    return render_template('department.html', action="Edit",
                           add_department=add_department, form=form,
                           department=dept, title="Edit Department")

@app.route('/hospital/dept/delete/<int:id>', methods=['GET', 'POST'])
def delete_dept(id):
    dept = session.query(Dept).filter(Dept.dept_no == id).one()
    session.delete(dept)
    session.commit()
    flash('You have successfully deleted the department.')

    return redirect(url_for('getDept'))

# Employee Report
@app.route("/hospital/employee", methods = ['GET'])
def getEmployee():
    employees = session.query(Employee)
    return render_template("employees.html", employees = employees)

# Create User
@app.route("/hospital/employee/add", methods = ['GET', 'POST'])
def createEmployee():
    add_emp = True

    form = EmployeeForm()
    if form.validate_on_submit():
        employee = Employee(e_id = form.e_id.data, e_type = form.e_type.data,
                        first_name = form.first_name.data, last_name = form.last_name.data,
                        dob = form.dob.data, address = form.address.data,
                        gender = form.gender.data, phone_number = form.phone_number.data,
                        emergency_contact = form.emergency_contact.data,
                        date_of_joining = form.date_of_joining.data,
                        date_of_resigning = form.date_of_resigning.data)
        try:
            # setattr(dept, 'dept_no', form.dept_no.data)
            # setattr(dept, 'dept_name', form.dept_name.data)
            session.add(employee)
            session.commit()
            flash('You have successfully added a new Employee.')
        except:
            flash('Error: e_id already exists.')
        return redirect(url_for('getEmployee'))
    return render_template('employee.html', action="Add",
                           add_emp=add_emp, form=form,
                           title="Add Employee")

@app.route("/hospital/employee/edit/<int:id>", methods = ['GET', 'POST'])
def edit_emp(id):
    add_emp = False

    employee = session.query(Employee).filter(Employee.e_id == id).one()  
    form = EmployeeForm(obj=Employee)
    if form.validate_on_submit():
        setattr(employee, 'e_id', form.e_id.data)
        setattr(employee, 'e_type', form.e_type.data)
        setattr(employee, 'first_name', form.first_name.data)
        setattr(employee, 'last_name', form.last_name.data)
        setattr(employee, 'dob', form.dob.data)
        setattr(employee, 'address', form.address.data)
        setattr(employee, 'gender', form.gender.data)
        setattr(employee, 'phone_number', form.phone_number.data)
        setattr(employee, 'emergency_contact', form.emergency_contact.data)
        setattr(employee, 'date_of_joining', form.date_of_joining.data)
        setattr(employee, 'date_of_resigning', form.date_of_resigning.data)
        session.commit()
        flash('You have successfully edited the Employee.')

        return redirect(url_for('getEmployee'))
    
    form.e_id.data = employee.e_id
    form.e_type.data = employee.e_type
    form.first_name.data = employee.first_name
    form.last_name.data = employee.last_name
    form.dob.data = employee.dob
    form.address.data = employee.address
    form.gender.data = employee.gender
    form.phone_number.data = employee.phone_number
    form.emergency_contact.data = employee.emergency_contact
    form.date_of_joining.data = employee.date_of_joining
    form.date_of_resigning.data = employee.date_of_resigning

    return render_template('employee.html', action="Edit",
                           add_emp=add_emp, form=form,
                           employee=employee, title="Edit Department")




@app.route("/hospital/employee/delete/<int:id>", methods = ['GET', 'POST'])
def delete_emp(id):
    employee = session.query(Employee).filter(Employee.e_id == id).one()
    session.delete(employee)
    session.commit()
    flash('You have successfully deleted the department.')

    return redirect(url_for('getEmployee'))



#Patient
@app.route("/hospital/patient", methods = ['GET', 'POST'])
def getPatient():
    patients = session.query(Patient)
    return render_template("patients.html", patients = patients)

@app.route("/hospital/patient/add", methods = ['GET', 'POST'])
def add_patient():
    add_patient = True

    form = PatientForm()
    if form.validate_on_submit():
        patient = Patient(p_id = form.p_id.data,
                        first_name = form.first_name.data, last_name = form.last_name.data,
                        gender = form.gender.data, phone_number = form.phone_number.data,
                        dob = form.dob.data, 
                        emergency_contact = form.emergency_contact.data,
                        address = form.address.data,
                        email = form.email.data)
        try:
            session.add(patient)
            session.commit()
            flash('You have successfully added a new Patient.')
        except:
            flash('Error: p_id already exists.')
        return redirect(url_for('getPatient'))
    return render_template('patient.html', action="Add",
                           add_patient=add_patient, form=form,
                           title="Add Patient")

@app.route("/hospital/patient/edit/<int:id>", methods = ['GET', 'POST'])
def edit_patient(id):
    add_patient = False

    patient = session.query(Patient).filter(Patient.p_id == id).one()  
    form = PatientForm(obj=Patient)
    if form.validate_on_submit():
        setattr(patient, 'p_id', form.p_id.data)
        setattr(patient, 'first_name', form.first_name.data)
        setattr(patient, 'last_name', form.last_name.data)
        setattr(patient, 'gender', form.gender.data)
        setattr(patient, 'phone_number', form.phone_number.data)
        setattr(patient, 'dob', form.dob.data)
        setattr(patient, 'emergency_contact', form.emergency_contact.data)
        setattr(patient, 'address', form.address.data)
        setattr(patient, 'email', form.email.data)
        session.commit()
        flash('You have successfully edited the Employee.')

        return redirect(url_for('getPatient'))
    
    form.p_id.data = patient.p_id
    form.first_name.data = patient.first_name
    form.last_name.data = patient.last_name
    form.gender.data = patient.gender
    form.phone_number.data = patient.phone_number
    form.dob.data = patient.dob
    form.emergency_contact.data = patient.emergency_contact
    form.address.data = patient.address
    form.email.data = patient.email

    return render_template('patient.html', action="Edit",
                           add_patient=add_patient, form=form,
                           patient=patient, title="Edit Patient")



@app.route("/hospital/patient/delete/<int:id>", methods = ['GET', 'POST'])
def delete_patient(id):
    patient = session.query(Patient).filter(Patient.p_id == id).one()
    session.delete(patient)
    session.commit()
    flash('You have successfully deleted the patient.')

    return redirect(url_for('getPatient'))


session.close()

