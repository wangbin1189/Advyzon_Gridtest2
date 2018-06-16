const index_user = () => {
  return fetch("/users").then(response => {
    return response.json();
  });
};

const create_user = userParam => {
  return fetch("/users", {
    method: "POST",
    body: JSON.stringify(userParam)
  });
};

const update_user = userParam => {
  return fetch("/users/" + userParam.id, {
    method: "PUT",
    body: JSON.stringify(userParam)
  }); // TODO: 读取保存后的用户信息
};

const delete_user = userId => {
  return fetch("/users/" + userId, {
    method: "DELETE"
  }); // TODO: 读取保存后的用户信息
};

var app = new Vue({
  el: "#root",
  data: {
    users: [],

    showingAddPrompt: false /*显示弹窗的初始值是false*/,
    newUserForm: {
      // 清空
      company: "3",
      education: "4",
      gender: "5",
      name: "1",
      title: "2"
    },

    showingEditPrompt: false,
    updateUserForm: {},

    showingDeletePrompt: false,
    userToBeDeleted: null
  },

  mounted: function() {
    console.log("mounted");
  },

  methods: {
    clearUserForm() {
      this.newUserForm = {};
    },
    createNewUser() {
      create_user(this.newUserForm).then(() => {
        this.clearUserForm();
        this.showingAddPrompt = false;
        return this.indexUsers();
      });
    },

    indexUsers() {
      index_user().then(userData => {
        this.users = userData;
      });
    },

    updateUser() {
      update_user(this.updateUserForm).then(() => {
        this.showingEditPrompt = false;
        return this.indexUsers();
      });
    },

    editUser(user) {
      // TODO: 复制user，就等于不是pass by reference
      this.updateUserForm = Object.assign({}, user);
      this.showingEditPrompt = true;
    },

    deleteUser() {
      delete_user(this.userToBeDeleted.id).then(() => {
        this.showingDeletePrompt = false;
        return this.indexUsers();
      });
    }
  },
  created() {
    this.indexUsers();
  }
});

window.app = app;
