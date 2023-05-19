package com.trifling.things.service;

import com.trifling.things.dto.request.LoginRequestDTO;
import com.trifling.things.dto.request.SignUpRequestDTO;
import com.trifling.things.dto.response.MyInfoResponseDTO;
import com.trifling.things.dto.request.UserModifyRequestDTO;
import com.trifling.things.entity.user.Interest;
import com.trifling.things.entity.user.User;
import com.trifling.things.repository.Review;
import com.trifling.things.repository.UserMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.trifling.things.service.LoginResult.*;


@Service
@RequiredArgsConstructor
@Slf4j
public class UserService {
    private final UserMapper userMapper;
    private final PasswordEncoder encoder;



    public boolean join(SignUpRequestDTO dto) {
        User user = User.builder()
                .userId(dto.getUserId())
                .userPassword(encoder.encode(dto.getUserPassword())) //encoder.encode
                .userEmail(dto.getUserEmail())
                .userGender(dto.getUserGender())
                .build();

//         매퍼에게 회원정보 전달해서 저장명령
        userMapper.save(user);
        return true;
    }

    public User findUser(String userId) {
        return userMapper.findUser(userId);
    }


    public boolean modify(UserModifyRequestDTO dto) {
        User user = User.builder().
                userId(dto.getUserId())
                .userPassword(dto.getUserPassword())
                .userEmail(dto.getUserEmail())
                .build();

        boolean flag = userMapper.modify(user);
        return flag;
    }



    // 중복검사 서비스 처리
    public boolean checkSignUpValue(String type, String keyword) {

        int flagNum = userMapper.isDuplicate(type, keyword);

        return flagNum == 1;
    }

    // 로그인 검증
    public LoginResult authenticate(LoginRequestDTO dto) {

        User foundUser = userMapper.findUser(dto.getUserId());

        // 회원가입 여부 확인
        if (foundUser == null) {
            return NO_ACC;
        }
        // 비밀번호 일치 확인
        if (encoder.matches(dto.getUserPassword(), foundUser.getUserPassword())) {
            return NO_PW;
        }

        return SUCCESS;
    }


//내가 작성한 리뷰 보기
public List<Review> myReviewList(int userNum){
    List<Review> reviews = userMapper.myReviewList(userNum);
    return reviews;
}

    //영화 찜하기 기능
    public List<Interest> myInterestList( int moiveNum) {
        List<Interest> interestUser = userMapper.interestList(moiveNum);
        return interestUser;
    }



    //마이페이지
    public   List<MyInfoResponseDTO> getMypage(String userId){
        return userMapper.myInfo(userId);
    }


}