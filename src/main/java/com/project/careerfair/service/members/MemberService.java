package com.project.careerfair.service.members;

import com.project.careerfair.mapper.members.MembersMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional
public class MemberService {

   private final MembersMapper mapper;


}
