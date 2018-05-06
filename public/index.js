/* global Vue, VueRouter, axios */
// homepage is the sign up page


var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!"
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};

var ProjectShowPage = {
  template: "#project-show-page",
  data: function() {
    return {
      project: {},
      skill: { 
        name: "",
        experience: ""
      }
    };
  },
  created: function() {
    axios.get("/projects/" + this.$route.params.id).then(function(response) {
      this.project = response.data;
      console.log(this.project);
    }.bind(this));

  },
  methods: {
    setProject(project) {
      this.project = project;
      var params = {
        project_id: project.id
      };
      console.log(params);
      axios.post("/project-users", params).then(function(response) {
        router.push("/login");
      }).catch(function(error) {
        this.errors = error.response.data.errors;
      }.bind(this));
    }
  },
  computed: {}
};

var ProjectsPage = {
  template: "#projects-page",
  data: function() {
    return {
      projects: []
    };
  },
  created: function() {
    axios.get("/projects").then(function(response) {
      this.projects = response.data;
      console.log(this.projects);
    }.bind(this));
  },
  methods: {
  },
  computed: {}
};

var ProjectNewPage = {
  template: "#projects-new-page",
  data: function() {
    return {
      name: "",
      projectType: "",
      description: "",
      keyResponsibilities: "",
      minimumRequirements: "",
      budget: "",
      skills:"",
      startDate: "",
      endDate: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name:this.name,
        project_type:this.projectType,
        description:this.description,
        key_responsibilities:this.keyResponsibilities,
        minimum_requirements:this.minimumRequirements,
        budget:this.budget,
        skills:this.skills,
        start_date:this.startDate,
        end_date:this.endDate,
      };
      axios
        .post("/projects", params)
        .then(function(response) {
          router.push("/projects");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var UsersProjectsPage = {
  template: "#users-projects-page",
  data: function() {
    return {
      projects: []
    };
  },
  created: function() {
    axios.get("/users-projects").then(function(response) {
      this.projects = response.data;
      console.log(this.projects);
    }.bind(this));

  },
  methods: {},
  computed: {}
};

var ProfilePage = {
  template: "#profile-page",
  data: function() {
    return {
      message: "Welcome User!",
      user: {},
      skills: {
        name: "",
        experience: ""
      }
    };
  },
  created: function() {
    axios.get("/users/" + this.$route.params.id).then(function(response) {
      this.user = response.data;
      console.log(this.user);
    }.bind(this));

  },
  methods: {},
  computed: {}
};
  

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/profile/:id");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      userName: "",
      bio: "",
      skills: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        user_name: this.userName,
        bio: this.bio,
        skills: this.skills,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/profile/:id", component: ProfilePage },
    { path: "/users-projects", component: UsersProjectsPage },
    { path: "/projects", component: ProjectsPage },
    { path: "/projects/new", component: ProjectNewPage },
    { path: "/projects/:id", component: ProjectShowPage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});

