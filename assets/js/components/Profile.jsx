import React from 'react';
import Header from 'components/Header';
import AddPost from 'components/AddPost';
import {
  Formik, Form, Field, ErrorMessage,
} from 'formik';

function Profile() {
  return (
    <div className="container">
      <div className="row">
        <div className="col-4 border" align="center">
        <Formik
          initialValues={{ name: '', age: 0, birthday: '1990-08-08', gender: '',
        species: '', toy: '', treat: '' }}
          onSubmit={(values, { setSubmitting }) => {
            
            createPet(values).finally(() => setSubmitting(false));
          }}
        >
          {({ isSubmitting }) => (
            <Form className="form signin-form">
              <label>
                Name:
                <Field className="form-control" type="text" name="name" />
              </label>
              <ErrorMessage name="name" component="div" />
              <label>
                Age:
                <Field className="form-control" type="number" min="0" name="age" />
              </label>
              <ErrorMessage name="age" component="div" />
              <label>
                Birthday:
                <Field className="form-control" type="date" max="2018-11-24" name="birthday" />
              </label>
              <ErrorMessage name="birthday" component="div" />
              <label>
                Gender:
                <Field className="form-control" type="text" name="gender" />
              </label>
              <ErrorMessage name="gender" component="div" />
              <label>
                Species:
                <Field className="form-control" type="text" name="species" />
              </label>
              <ErrorMessage name="species" component="div" />
              <label>
                Favorite Toy:
                <Field className="form-control" type="text" name="toy" />
              </label>
              <ErrorMessage name="toy" component="div" />
              <label>
                Favorite Treat:
                <Field className="form-control" type="text" name="treat" />
              </label>
              <ErrorMessage name="treat" component="div" />
              <button type="submit" className="btn btn-primary" disabled={isSubmitting}>
                Create Pet
              </button>
            </Form>
          )}
        </Formik>
        </div>
        <div className="col-8 border">
          <Header />
          <AddPost />
        </div>
      </div>
    </div>
  );
}

export default Profile;