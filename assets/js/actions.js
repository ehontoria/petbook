import * as c from 'constants.js';

export const mkSimpleAction = type => payload => ({ type, payload });
export const newSession = mkSimpleAction(c.NEW_SESSION);
export const postList = mkSimpleAction(c.POST_LIST);
export const userList = mkSimpleAction(c.USER_LIST);
